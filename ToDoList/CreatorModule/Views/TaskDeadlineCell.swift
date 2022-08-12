//
//  TaskDeadlineCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit

final class TaskDeadlineCell: UITableViewCell {
    let picker = UIDatePicker()
    
    func configure() {
        self.selectionStyle = .none
        self.contentView.isUserInteractionEnabled = true
        
        picker.minimumDate = Date.now
        picker.locale = Locale(identifier: "ru_RU")
        
        self.addSubview(picker)
        setConstraints()
    }
    
    private func setConstraints() {
        picker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            picker.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            picker.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
