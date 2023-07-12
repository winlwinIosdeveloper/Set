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
		print(cards.count)
		print(deck.deck.count)
	}
	
	
	
	// MARK: reset Cards Default
	private func resetCard() {
		for index in cards.indices {
			cards[index].isChoosen = false
		}
		touchCount = 0
	}
	
	
	func isSet(_ cards: [Card]) -> Bool {
		// Check if the number attribute is all the same or all different
		let choosenCards = cards.indices.filter {
			cards[$0].isChoosen
		}
		
		let (first, second, third) = (choosenCards[0], choosenCards[1], choosenCards[2])
			
		
		// These part of implementation is from chatGPT
		let isNumberSet = (cards[first].number == cards[second].number && cards[second].number == cards[third].number) ||
						  (cards[first].number != cards[second].number && cards[second].number != cards[third].number && cards[first].number != cards[third].number)

		// Check if the symbol attribute is all the same or all different
		let isSymbolSet = (cards[first].shape == cards[second].shape && cards[second].shape == cards[third].shape) ||
						  (cards[first].shape != cards[second].shape && cards[second].shape != cards[third].shape && cards[first].shape != cards[third].shape)

		// Check if the shading attribute is all the same or all different
		let isShadingSet = (cards[first].shade == cards[second].shade && cards[second].shade == cards[third].shade) ||
						   (cards[first].shade != cards[second].shade && cards[second].shade != cards[third].shade && cards[first].shade != cards[third].shade)

		// Check if the color attribute is all the same or all different
		let isColorSet = (cards[first].color == cards[second].color && cards[second].color == cards[third].color) ||
						 (cards[first].color != cards[second].color && cards[second].color != cards[third].color && cards[first].color != cards[third].color)

		// Return true if all attributes satisfy the set conditions, false otherwise
		return isNumberSet && isSymbolSet && isShadingSet && isColorSet
	}
	
	private func dealThreeMoreCard() {
		cards += [deck.drawRendomCard(), deck.drawRendomCard(), deck.drawRendomCard()]
	}

}
