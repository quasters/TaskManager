//
//  DaySegmentControl.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class CustomSegmentControl: UIView {
    var values: Observable<Int>?
    private var tabTitles: [String]?
    private var height: Double = 0
    private var width: Double = 0
    
    private var buttons = [UIButton]()
    private let selector = UIView()
    
    private let disposeBag = DisposeBag()
    
    func configurate(tabTitles: [String], height: Double, width: Double) {
        self.tabTitles = tabTitles
        self.height = height
        self.width = width
        setUpSegmentControl()
    }
    
    // MARK: Set UI Elements
    private func setUpSegmentControl() {
        setUpButtons()
        setUpSelector()
        setUpStack()
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
                button.isEnabled = false
            } else {
                button.setTitleColor(UIColor(named: "blackAdaptive"), for: .normal)
            }
            button.tag = index
            button.setTitle(title, for: .normal)
            buttons.append(button)
        }
        binding()
    }
    
    // MARK: - Rx Bindings
    private func binding() {
        let tags = buttons
            .map { ($0.rx.tap, $0.tag) }
            .map { obs, tag in obs.map { tag } }
        
        values = Observable.merge(tags).startWith(0)
        
        values?
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] tag in
                guard let self = self else { return }
                for button in self.buttons {
                    button.setTitleColor(UIColor(named: "blackAdaptive"), for: .normal)
                    button.isEnabled = true
                }
                self.buttons[tag].setTitleColor(.systemBackground, for: .normal)
                self.buttons[tag].isEnabled = false
                let selectorPosition = self.width / Double(self.buttons.count) * Double(tag)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorPosition
                }
            })
            .disposed(by: disposeBag)
    }
}
