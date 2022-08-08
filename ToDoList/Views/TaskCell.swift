//
//  TaskCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    let view = UIView()
    
    func configure() {
        self.selectionStyle = .none
        
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        self.addSubview(view)
        setConstraints()
    }
    
    private func setConstraints() {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalTo: self.widthAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
