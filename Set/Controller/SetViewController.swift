//
//  ViewController.swift
//  Set
//
//  Created by Win Lwin on 05/07/2023.
//

import UIKit

class SetViewController: UIViewController {
	
	lazy var game = Set(numberOfPairOfCards: numberOfPairOfCards)

	@IBOutlet var cardButtons: [UIButton]!
	
	var numberOfPairOfCards: Int {
		return cardButtons.count
	}

	@IBAction func touchCard(_ sender: UIButton) {
		if let index = cardButtons.firstIndex(of: sender) {
			game.chooseCard(at: index)
			updateViewFromModel()
		}	
	}

	
	private func updateViewFromModel() {
		for index in cardButtons.indices {
			let button = cardButtons[index]
			if game.cards[index].isChoosen {
				button.layer.borderWidth = 2.0
				button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
			} else {
				button.layer.borderWidth = 0
			}
		}
	}
	

}

