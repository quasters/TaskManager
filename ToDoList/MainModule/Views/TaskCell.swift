//
//  TaskCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    private let taskBackView = UIView()
    private let categoryBackView = UIView()
    private let categoryLabel = UILabel()
    private let taskLabel = UILabel()
    
    func configure() {
        self.selectionStyle = .none
        
        setTaskBackView()
        setCategoryBackView()
        setCategoryLabel()
        setTaskLabel()
        
        self.addSubview(taskBackView)
        self.addSubview(categoryBackView)
        self.addSubview(categoryLabel)
        self.addSubview(taskLabel)
        
        setConstraints()
    }
    
    private func setCategoryBackView() {
        categoryBackView.backgroundColor = .init(white: 1, alpha: 0.55)
        categoryBackView.layer.cornerRadius = 12
        categoryBackView.layer.masksToBounds = false
    }
    
    private func setCategoryLabel() {
        categoryLabel.text = "Important"
        categoryLabel.font = .systemFont(ofSize: 14)
    }
    
    private func setTaskLabel() {
        taskLabel.text = "Hello everyone"
        taskLabel.font = .boldSystemFont(ofSize: 24)
        
    }
    
    private func setTaskBackView() {
        taskBackView.backgroundColor = .yellow
        taskBackView.layer.cornerRadius = 12
        taskBackView.layer.masksToBounds = false
        
    }
    
    private func setConstraints() {
        categoryBackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryBackView.heightAnchor.constraint(equalToConstant: 24),
            categoryBackView.widthAnchor.constraint(equalTo: categoryLabel.widthAnchor, constant: 24),
            categoryBackView.leftAnchor.constraint(equalTo: taskBackView.leftAnchor, constant: 20),
            categoryBackView.topAnchor.constraint(equalTo: taskBackView.topAnchor, constant: 20)
        ])
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: categoryBackView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: categoryBackView.centerYAnchor)
        ])
        
        taskBackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskBackView.widthAnchor.constraint(equalTo: self.widthAnchor),
            taskBackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            taskBackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskLabel.leftAnchor.constraint(equalTo: taskBackView.leftAnchor, constant: 20),
            taskLabel.rightAnchor.constraint(equalTo: taskBackView.rightAnchor, constant: -20),
            taskLabel.topAnchor.constraint(equalTo: categoryBackView.bottomAnchor, constant: 10),
            //titleLablel.heightAnchor.constraint(equalToConstant: 50),
            //titleLablel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
