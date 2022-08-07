//
//  ViewController.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 06.08.2022.
//

import UIKit

class MainVC: UIViewController {
    var viewModel: MainVMProtocol?
    
    var headerView: HeaderView?
    var daySegment: DaySegmentControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setHeader()
        setTabs()
    }
    
    func bindViewModel() {
        
    }
    
    private func setHeader() {
        headerView = HeaderView()
        guard let headerView = headerView else { return }
        self.view.addSubview(headerView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        headerView.configure()
    }
    
    private func setTabs() {
        daySegment = DaySegmentControl()
        daySegment?.tabTitles = ["Today", "Upcoming", "Done", "Failed"]
        let segmentHeight = 26.0
        
        guard let daySegment = daySegment else { return }
        daySegment.cornerRadius = segmentHeight / 2
        daySegment.layer.cornerRadius = segmentHeight / 2
        daySegment.layer.masksToBounds = true
        self.view.addSubview(daySegment)
        
        guard let headerView = headerView else { return }
        daySegment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daySegment.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            daySegment.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            daySegment.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            daySegment.heightAnchor.constraint(equalToConstant: segmentHeight)
        ])
        
        daySegment.update()
    }
}

