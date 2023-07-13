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
			loadCardButtons()
		}
	}
	
	
	
	// MARK: Deal 3 more cards
	@IBAction func DealThreeMoreCard() {
		dealCardCounts += 3
	}
	@IBOutlet weak var threeMoreCardButton: UIButton! {
		didSet {
			threeMoreCardButton.layer.cornerRadius = 5.0
		}
	}
	var dealCardCounts = 12 {
		didSet {
			if dealCardCounts == cardButtons.count {
				threeMoreCardButton.isHidden = true
			}
			for index in 0..<dealCardCounts {
				if dealCardCounts <= cardButtons.count, cardButtons[index].isHidden {
					cardButtons[index].isHidden = false
					print(dealCardCounts)
				}
			}
		}
	}
	
	
	// MARK: Touch Card
	@IBAction func touchCard(_ sender: UIButton) {
		if let index = cardButtons.firstIndex(of: sender) {
			game.chooseCard(at: index)
			print(game.cards[index])
			updateViewFromModel()
		}	
	}
	
	
	
	// MARK: Update UI
	private func updateViewFromModel() {
		loadCardButtons()
		for index in cardButtons.indices {
			let button = cardButtons[index]
			if game.cards[index].isChoosen {
				button.layer.borderWidth = 2.0
				button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
			} else {
				button.layer.borderWidth = 0.0
			}
		}
	}
		

	
	
}
















extension SetViewController {
	private func loadCardButtons() {
		for index in cardButtons.indices {
			let count = game.cards[index].number.rawValue
			let shape = contents[game.cards[index].shape.rawValue]!
			let color = game.cards[index].color.rawValue
			let shade = game.cards[index].shade.rawValue
			let content = String(repeating: shape, count: count)
			let button = cardButtons[index]
			// add necessory attribute to the button title
			attributedTextOnButton(button: button, count: count, shape: shape, color: color, shade: shade, content: content)
		}
	}
	
	
	private func attributedTextOnButton(button: UIButton, count: Int, shape: String, color: String, shade: String, content: String) {
		switch shade {
		case "solid":
			button.setTitle(content, for: UIControl.State.normal)
			button.setTitleColor(contentColor(name: color), for: UIControl.State.normal)
			button.layer.cornerRadius = 5.0;
			
		case "stripe":
			button.setTitle(content, for: UIControl.State.normal)
			button.setTitleColor(contentColor(name: color).withAlphaComponent(0.3), for: UIControl.State.normal)
			button.layer.cornerRadius = 5.0;
			
		case "open":
			let attributes : [NSAttributedString.Key: Any] = [
				.strokeWidth: 8.0,
				.strokeColor: contentColor(name: color),
			]
			let title = NSAttributedString(string: content, attributes: attributes)
			button.setAttributedTitle(title, for: UIControl.State.normal)
			button.layer.cornerRadius = 5.0;
			
		default:
			button.setTitle("?", for: UIControl.State.normal)
			button.setTitleColor(contentColor(name: "black").withAlphaComponent(1), for: UIControl.State.normal)
			button.layer.cornerRadius = 5.0;
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
