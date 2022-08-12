//
//  ColorPickerCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit
import RxSwift

class ColorPickerCell: UITableViewCell {
    var colorButtons = [UIButton]()
    private var stack = UIStackView()
    
    private var radius: Double = 15
        
    private let disposeBag = DisposeBag()
    
    func configure(radius: Double) {
        self.selectionStyle = .none
        self.contentView.isUserInteractionEnabled = true
        
        self.radius = radius
        
        setUpStack()
        setUpButtons()
        
        binding()
    }
    
    private func setUpStack() {
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 13
        stack.layer.cornerRadius = radius
        stack.layer.masksToBounds = false
        
        self.addSubview(stack)
        setStackConstraints()
    }
    
    private func setUpButtons() {
        colorButtons.removeAll()
        for (index, color) in TaskColor.allCases.enumerated() {
            let button = UIButton(type: .system)
            button.layer.cornerRadius = radius
            button.layer.masksToBounds = false
            button.backgroundColor = color.getColor()
            button.layer.borderColor = .init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
            if index == 0 {
                button.layer.borderWidth = 2
            }
            button.tag = index
            colorButtons.append(button)
            stack.addArrangedSubview(button)
        }
    }
    
    private func binding() {
        for colorButton in colorButtons {
            colorButton.rx.tap.subscribe { [weak self] event in
                guard let self = self else { return }
                self.colorButtons.map { $0.layer.borderWidth = 0 }
                colorButton.layer.borderWidth = 2
            }.disposed(by: disposeBag)
        }
    }
    
    
    private func setStackConstraints() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            stack.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
