//
//  TaskCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class TaskCell: UITableViewCell {
    let editButton = UIButton()
    let doneButton = UIButton()
    private let backView = UIView()
    private let categoryBackView = UIView()
    private let categoryLabel = UILabel()
    private let taskLabel = UILabel()
    private let dateLabel = UILabel()
    private let timeLabel = UILabel()
    
    private var deadline: Date?
    
    private let sideIndent: Double = 20
    
    func configure(title: String?, category: String?, date: Date?, color: TaskColor?, isCompleted: Bool, isFailed: Bool) {
        self.selectionStyle = .none
        
        doneButton.backgroundColor = isCompleted ? .black : .clear
        taskLabel.text = title
        categoryLabel.text = category
        deadline = date
        
        setBackView(with: color)
        setCategoryView()
        if !isFailed {
            setButtons()
        }
        setTaskLabel()
        setDateLabels()
    }
    
    // MARK: - Set up views
    private func setBackView(with color: TaskColor?) {
        backView.backgroundColor = color?.getColor()
        backView.layer.cornerRadius = 12
        backView.layer.masksToBounds = false
        
        self.addSubview(backView)
        setBackViewConstraints()
    }
    
    private func setCategoryView() {
        categoryBackView.backgroundColor = .init(white: 1, alpha: 0.265)
        categoryBackView.layer.cornerRadius = 12
        categoryBackView.layer.masksToBounds = false
        
        categoryLabel.font = .systemFont(ofSize: 14)
        categoryLabel.textColor = .black
        
        self.addSubview(categoryBackView)
        self.addSubview(categoryLabel)
        setCategoryViewConstraints()
    }
    
    private func setButtons() {
        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editButton.imageView?.layer.transform = CATransform3DMakeScale(1.25, 1.25, 1.25)
        editButton.tintColor = .black
        
        doneButton.layer.cornerRadius = 11
        doneButton.layer.borderWidth = 2.0
        doneButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        doneButton.layer.masksToBounds = false
        
        self.addSubview(editButton)
        self.addSubview(doneButton)
        setButtonsConstraints()
    }
    
    private func setTaskLabel() {
        taskLabel.numberOfLines = 2
        taskLabel.font = .boldSystemFont(ofSize: 24)
        taskLabel.textColor = .black
        
        self.addSubview(taskLabel)
        setTaskLabelConstraints()
    }
    
    private func setDateLabels() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        
        formatter.dateFormat = "d MMMM, y"
        dateLabel.text = formatter.string(from: deadline ?? Date.now)
        formatter.dateFormat = "HH:mm"
        timeLabel.text = formatter.string(from: deadline ?? Date.now)
        
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .black
        timeLabel.font = .systemFont(ofSize: 14)
        timeLabel.textColor = .black
        
        self.addSubview(dateLabel)
        self.addSubview(timeLabel)
        setDateLabelsConstraints()
    }
    
    // MARK: - Constraints
    private func setBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalTo: self.widthAnchor),
            backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7)
        ])
    }
    
    private func setCategoryViewConstraints() {
        categoryBackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryBackView.heightAnchor.constraint(equalToConstant: 24),
            categoryBackView.widthAnchor.constraint(equalTo: categoryLabel.widthAnchor, constant: 24),
            categoryBackView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: sideIndent),
            categoryBackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: sideIndent)
        ])
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: categoryBackView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: categoryBackView.centerYAnchor)
        ])
    }
    
    private func setButtonsConstraints() {
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.heightAnchor.constraint(equalToConstant: 24),
            editButton.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -sideIndent),
            editButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: sideIndent)
        ])
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneButton.widthAnchor.constraint(equalToConstant: 22),
            doneButton.heightAnchor.constraint(equalToConstant: 22),
            doneButton.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -sideIndent),
            doneButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -sideIndent)
        ])
    }
    
    private func setTaskLabelConstraints() {
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: sideIndent),
            taskLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -sideIndent),
            taskLabel.topAnchor.constraint(equalTo: categoryBackView.bottomAnchor, constant: 10),
        ])
    }
    
    private func setDateLabelsConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: sideIndent),
            timeLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -sideIndent)
        ])
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: sideIndent),
            dateLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -3)
        ])
    }
}
