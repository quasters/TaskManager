//
//  ViewController.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 06.08.2022.
//

import UIKit

class MainVC: UIViewController {
    var viewModel: MainVMProtocol?
    
    private var headerView: HeaderView?
    private var daySegment: TasksSegmentControl?
    private var addButton: UIButton?
    
    private let sideIndent: Double = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()
        setTabs()
        setAddButton()
    }
        
    private func setHeader() {
        headerView = HeaderView()
        guard let headerView = headerView else { return }
        self.view.addSubview(headerView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        headerView.configure()
    }
    
    private func setTabs() {
        daySegment = TasksSegmentControl()
        guard let daySegment = daySegment else { return }
        
        let segmentHeight = 26.0

        daySegment.layer.cornerRadius = segmentHeight / 2
        daySegment.layer.masksToBounds = true
        self.view.addSubview(daySegment)
        
        guard let headerView = headerView else { return }
        daySegment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daySegment.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            daySegment.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            daySegment.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
            daySegment.heightAnchor.constraint(equalToConstant: segmentHeight)
        ])
        
        let tabs = ["Today", "Upcoming", "Task Done", "Failed"]
        let width = self.view.frame.width - (sideIndent * 2)
        daySegment.configurate(tabTitles: tabs, cornerRadius: segmentHeight / 2, width: width)
    }
    
    private func setAddButton() {
        addButton = UIButton()
        guard let addButton = addButton else { return }
        
        addButton.backgroundColor = .black
        
        //addButton.setTitle("Add task", for: .normal)
        addButton.titleLabel?.text = "Add task"
        addButton.titleLabel?.textColor = .white
        addButton.titleLabel?.font = .systemFont(ofSize: 20)
        self.view.addSubview(addButton)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 100),
            addButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

