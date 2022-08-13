//
//  ColorPickerCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class ColorPickerCell: UITableViewCell {
    var values: Observable<Int>?
    
    private var colorButtons = [UIButton]()
    private var stack = UIStackView()
    
    private var radius: Double = 15
        
    private let disposeBag = DisposeBag()
    
    func configure(radius: Double) {
        self.selectionStyle = .none
        self.contentView.isUserInteractionEnabled = true
        
        self.radius = radius
        
        setUpStack()
        setUpButtons()
    }
        
    // MARK: - Setups
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
            button.layer.borderColor = UIColor(named: "blackAdaptive")?.cgColor
            if index == 0 {
                button.layer.borderWidth = 1
                button.isEnabled = false
            }
            button.tag = index
            colorButtons.append(button)
            stack.addArrangedSubview(button)
        }
        binding()
    }
    
    // MARK: - Rx Bindings
    private func binding() {
        let tags = colorButtons
            .map { ($0.rx.tap, $0.tag) }
            .map { obs, tag in obs.map { tag } }
        values = Observable.merge(tags).startWith(0)
        
        values?
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] tag in
                guard let self = self else { return }
                for button in self.colorButtons {
                    button.layer.borderWidth = 0
                    button.isEnabled = true
                }
                self.colorButtons[tag].layer.borderWidth = 1
                self.colorButtons[tag].isEnabled = false
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Constraints
    private func setStackConstraints() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            stack.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
