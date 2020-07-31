//
//  ButtonTableViewCell.swift
//  TaskCoreData35
//
//  Created by Colton Swapp on 7/29/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    // MARK: - Properties
    var delegate: ButtonTableViewCellDelegate?
    
    // MARK: - Actions
    @IBAction func buttonTapped(_ sender: Any) {
        guard let delegate = delegate else { return }
        delegate.toggledIsCompleteButton(for: self)
        
    }
    
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setBackgroundImage(#imageLiteral(resourceName: "complete"), for: .normal)
        } else {
            completeButton.setBackgroundImage(#imageLiteral(resourceName: "incomplete"), for: .normal
            )
        }
    }
    
}
extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.taskName
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func toggledIsCompleteButton(for cell: ButtonTableViewCell)
}
