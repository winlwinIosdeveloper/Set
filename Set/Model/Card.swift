//
//  Card.swift
//  Set
//
//  Created by Win Lwin on 06/07/2023.
//

import Foundation

struct Card {
	
	// MARK: Property
	var shape: Shape
	var color: Color
	var number: Number
	var shade: Shade
	
	var isChoosen = false
	
	enum Shape: String, CaseIterable {
		case diamond
		case squiggle
		case oval
	}
	
	enum Color: String, CaseIterable {
		case red
		case green
		case purple
	}
	
	enum Number: Int, CaseIterable {
		case One =  1
		case Two = 2
		case Three = 3
	}
	
	// solid, striped, open
	enum Shade: CaseIterable {
		case solid
		case stripe
		case open
	}

}

