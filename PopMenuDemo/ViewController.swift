//
//  ViewController.swift
//  PopMenuDemo
//
//  Created by mac on 2025/3/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listView: UITableView!
    
    let cellIdentifier: String = String(describing: TestCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listView.delegate = self
        listView.dataSource = self
        
        listView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        // Do any additional setup after loading the view.
    }
    
    func showPopMenu(_ sourceView: UIButton) {
        let controller = PopMenuViewController(sourceView: sourceView, actions: [
            PopMenuDefaultAction(title: "Click me to", image: nil, color: .yellow),
            PopMenuDefaultAction(title: "Pop another menu", image: nil, color: #colorLiteral(red: 0.9816910625, green: 0.5655395389, blue: 0.4352460504, alpha: 1)),
            PopMenuDefaultAction(title: "Try it out!", image: nil, color: .white)
        ])
        
        // Customize appearance
        controller.appearance.popMenuFont = UIFont(name: "AvenirNext-DemiBold", size: 16)!
        controller.appearance.popMenuBackgroundStyle = .none()
        controller.appearance.popMenuContentPosition = .top
        // Configure options
        controller.shouldDismissOnSelection = false
//        controller.delegate = self
        
        controller.didDismiss = { selected in
            print("Menu dismissed: \(selected ? "selected item" : "no selection")")
        }
        
        // Present menu controller
        present(controller, animated: true, completion: nil)
    }
}

// MARK: -  UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TestCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TestCell
        cell.leftBtn.addTarget(self, action: #selector(cellLeftTouched(_:)), for: .touchUpInside)
        cell.rightBtn.addTarget(self, action: #selector(cellRightTouched(_:)), for: .touchUpInside)
        cell.centerBtn.addTarget(self, action: #selector(cellCenterTouched(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func cellLeftTouched(_ sender: UIButton) {
        showPopMenu(sender)
    }
    
    @objc func cellRightTouched(_ sender: UIButton) {
        showPopMenu(sender)
    }
    
    @objc func cellCenterTouched(_ sender: UIButton) {
        showPopMenu(sender)
    }
}
