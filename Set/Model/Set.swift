//
//  Set.swift
//  Set
//
//  Created by Win Lwin on 06/07/2023.
//

import Foundation

class Set {
	var deck = Deck()
	
	var cards = [Card]()
	
	var touchCount = 0 {
		didSet {
			if touchCount == 3 {
				resetCard()
			}
		}
	}

	
	
	// MARK: choose card
	func chooseCard(at index: Int) {
		if cards[index].isChoosen {
			cards[index].isChoosen = false
			touchCount -= 1
		} else {
			cards[index].isChoosen = true
			touchCount += 1
		}
	}
	
	
	
	// MARK: initializer
	init(numberOfPairOfCards: Int) {
		for _ in 1...numberOfPairOfCards {
			let card = deck.drawRendomCard()
			cards += [card]
		}
		cards.shuffle()
	}
	
	
	
	// MARK: reset Cards Default
	private func resetCard() {
		for index in cards.indices {
			cards[index].isChoosen = false
		}
		touchCount = 0
	}
}
