//
//  TaskTitleCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit

class TaskTitleCell: UITableViewCell {
    let textField = UITextField()
    
    func configure(title: String? = nil) {
        self.selectionStyle = .none
        self.contentView.isUserInteractionEnabled = true
        
        textField.delegate = self
        
        textField.placeholder = "Buy milk"
        if let title = title {
            textField.text = title
        }
        
        self.addSubview(textField)
        setConstraints()
    }
    
    private func setConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            textField.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}

extension TaskTitleCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let isforbiddenSpace = string.contains(where: {$0 == " " && range.location == 0})
        return (!isforbiddenSpace && range.location < 25)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
