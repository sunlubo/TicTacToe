//
//  TicTacToeViewController.swift
//  TiCTacToe
//
//  Created by sunlubo on 2017/2/9.
//  Copyright © 2017年 slb. All rights reserved.
//

import UIKit

final class TicTacToeViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var winnerPlayerView: UIView!
    @IBOutlet weak var winnerPlayerLabel: UILabel!
    
    var cellButtons = [UIButton]()
    
    lazy var presenter: TicTacToePresenter = {
        return TicTacToePresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellButtons.append(contentsOf: [button1, button2, button3, button4, button5, button6, button7, button8, button9])
        
        resetButtonClicked()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.viewDidDisappear()
    }
    
    @IBAction func cellsClicked(button: UIButton) {
        let tag = button.tag.description
        let row = Int(tag.substring(to: tag.index(tag.startIndex, offsetBy: 1)))! - 1
        let col = Int(tag.substring(with: tag.index(tag.startIndex, offsetBy: 1)..<tag.endIndex))! - 1
        
        presenter.cellsClicked(row: row, col: col)
    }
    
    @IBAction func resetButtonClicked() {
        presenter.resetButtonClicked()
    }
}

// MARK: - TicTacToeView
extension TicTacToeViewController: TicTacToeView {
    
    func showWinner(_ winner: String) {
        winnerPlayerLabel.text = winner
        winnerPlayerView.isHidden = false
    }
    
    func clearWinnerDisplay() {
        winnerPlayerLabel.text = nil
        winnerPlayerView.isHidden = true
    }
    
    func clearButtons() {
        cellButtons.forEach({ $0.setTitle(nil, for: .normal) })
    }
    
    func setButtonText(_ row: Int, _ col: Int, _ text: String) {
        let button = cellButtons.filter({ $0.tag == Int("\(row + 1)\(col + 1)")! }).first!
        button.setTitle(text, for: .normal)
    }
}
