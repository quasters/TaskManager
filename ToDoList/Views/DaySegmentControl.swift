//
//  DaySegmentControl.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 07.08.2022.
//

import UIKit

class DaySegmentControl: UIView {
    var tabTitles: [String]?
    var cornerRadius: Double?
    private var buttons = [UIButton]()
    private var selector = UIView()
    
    func update() {
        setUpStack()
        setUpSelector()
    }
    
    private func setUpStack() {
        setUpButtons()
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
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
        selector.backgroundColor = .black
        selector.layer.cornerRadius = cornerRadius ?? 5
        selector.layer.masksToBounds = false
        
        self.addSubview(selector)
        selector.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selector.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4),
            selector.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    private func setUpButtons() {
        buttons.removeAll()
        guard let tabTitles = tabTitles else { return }
        for title in tabTitles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            buttons.append(button)
        }
    }
    
    private func bind(button: UIButton) {
        button
    }
}
