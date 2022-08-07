//
//  DaySegmentControl.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

class TasksSegmentControl: UIView {
    private var tabTitles: [String]?
    private var cornerRadius: Double = 0
    private var width: Double = 0
    
    private var buttons = [UIButton]()
    private var selector = UIView()
    
    var disposeBag = DisposeBag()
    
    func configurate(tabTitles: [String], cornerRadius: Double, width: Double) {
        self.tabTitles = tabTitles
        self.cornerRadius = cornerRadius
        self.width = width
        update()
    }
    
    private func update() {
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
        addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: self.leftAnchor),
            stack.rightAnchor.constraint(equalTo: self.rightAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setUpSelector() {
        selector.frame = CGRect(x: 0, y: 0, width: width / Double(buttons.count), height: cornerRadius * 2)
        selector.backgroundColor = .black
        selector.layer.cornerRadius = cornerRadius
        selector.layer.masksToBounds = false
        
        self.addSubview(selector)
    }
    
    private func setUpButtons() {
        buttons.removeAll()
        guard let tabTitles = tabTitles else { return }
        for (index, title) in tabTitles.enumerated() {
            let button = UIButton(type: .system)
            if index == 0 {
                button.setTitleColor(.white, for: .normal)
            } else {
                button.setTitleColor(.black, for: .normal)
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
                self.buttons.map { $0.setTitleColor(.black, for: .normal) }
                button.setTitleColor(.white, for: .normal)
                let selectorPosition = self.width / Double(self.buttons.count) * Double(button.tag)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorPosition
                }
            }.disposed(by: disposeBag)
        }
    }
}
