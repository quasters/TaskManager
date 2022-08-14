//
//  TaskDeadlineCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class TaskDeadlineCell: UITableViewCell {
    let picker = UIDatePicker()
    
    func configure(deadline: Date? = nil) {
        self.selectionStyle = .none
        self.contentView.isUserInteractionEnabled = true
        
        if let deadline = deadline {
            picker.date = deadline
            picker.minimumDate = deadline
        } else {
            picker.minimumDate = Date.now
        }
        
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
