//
//  ViewController.swift
//  Set
//
//  Created by Win Lwin on 05/07/2023.
//

import UIKit

class SetViewController: UIViewController {
	let contents = ["diamond":"▲", "oval":"●", "squiggle":"■"]
	
	// MARK: Create game
	lazy var game = Set(numberOfPairOfCards: numberOfPairOfCards)
	var numberOfPairOfCards: Int {
		return cardButtons.count
	}
	
	
	// set all the button content when loaded
	@IBOutlet var cardButtons: [UIButton]! {
		didSet {
			for index in cardButtons.indices {
				let count = game.cards[index].number.rawValue
				let shape = contents[game.cards[index].shape.rawValue]!
				let color = game.cards[index].color.rawValue
				let shade = game.cards[index].shade
				let content = String(repeating: shape, count: count)
				
				let button = cardButtons[index]
				button.setTitle(content, for: UIControl.State.normal)
				button.setTitleColor(contentColor(name: color), for: UIControl.State.normal)
			}
		}
	}
	
	@IBAction func touchCard(_ sender: UIButton) {
		if let index = cardButtons.firstIndex(of: sender) {
			game.chooseCard(at: index)
			updateViewFromModel()
		}	
	}

	
	
	// MARK: Update UI
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
	
	private func contentColor(name: String) -> UIColor {
		switch name {
		case "red":return UIColor.red
		case "green":return UIColor.green
		case "purple": return UIColor.purple
		default:return UIColor.systemBlue
		}
	}
	
	

}

