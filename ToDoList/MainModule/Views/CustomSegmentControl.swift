//
//  DaySegmentControl.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

class CustomSegmentControl: UIView {
    private var tabTitles: [String]?
    private var height: Double = 0
    private var width: Double = 0
    
    private var buttons = [UIButton]()
    private var selector = UIView()
    
    var disposeBag = DisposeBag()
    
    func configurate(tabTitles: [String], height: Double, width: Double) {
        self.tabTitles = tabTitles
        self.height = height
        self.width = width
        setUpSegmentControl()
    }
    
    private func setUpSegmentControl() {
        setUpButtons()
        setUpSelector()
        setUpStack()
        binding()
    }

    private func setUpStack() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.addSubview(stack)
    }
    
    private func setUpSelector() {
        selector.frame = CGRect(x: 0, y: 0, width: width / Double(buttons.count), height: height)
        selector.backgroundColor = UIColor(named: "blackAdaptive")
        selector.layer.cornerRadius = height / 2
        selector.layer.masksToBounds = false
        
        self.addSubview(selector)
    }
    
    private func setUpButtons() {
        buttons.removeAll()
        guard let tabTitles = tabTitles else { return }
        for (index, title) in tabTitles.enumerated() {
            let button = UIButton(type: .system)
            if index == 0 {
                button.setTitleColor(.systemBackground, for: .normal)
            } else {
                button.setTitleColor(UIColor(named: "blackAdaptive"), for: .normal)
            }
            button.tag = index
            button.setTitle(title, for: .normal)
            buttons.append(button)
        }
    }
    
    private func binding() {
        for button in buttons {
            button.rx.tap.subscribe { [weak self] event in
                guard let self = self else { return }
                self.buttons.map { $0.setTitleColor(UIColor(named: "blackAdaptive"), for: .normal) }
                button.setTitleColor(.systemBackground, for: .normal)
                let selectorPosition = self.width / Double(self.buttons.count) * Double(button.tag)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorPosition
                }
            }.disposed(by: disposeBag)
        }
    }
}
