//
//  CheckNomeIndirizzo.swift
//  Ratatuille23Tests
//
//  Created by Marzia Pirozzi on 06/11/23.
//

import XCTest
@testable import Ratatuille23

final class CheckNomeIndirizzo: XCTestCase {

    func testNomeNotNullIndirizzoNotNull() throws {
        // Arrange
        let nome = "vsjuejg"
        let indirizzo = "vyirg"
        
        // Act
        let risultato = functions.checkNomeIndirizo(nome: nome, indirizzo: indirizzo)
        
        // Assert
        XCTAssertEqual(risultato, true)
    }
    
    func testNomeNotNullIndirizzoNull() throws {
        // Arrange
        let nome = "vsjuejg"
        let indirizzo: String? = nil
        
        // Act
        let risultato = functions.checkNomeIndirizo(nome: nome, indirizzo: indirizzo ?? "")
        
        // Assert
        XCTAssertEqual(risultato, false)
    }
    
    func testNomeNullIndirizzoNotNull() throws {
        // Arrange
        let nome: String? = nil
        let indirizzo = "sirkfguefvggh"
        
        // Act
        let risultato = functions.checkNomeIndirizo(nome: nome ?? "", indirizzo: indirizzo)
        
        // Assert
        XCTAssertEqual(risultato, false)
    }
    
    func testNomeNullIndirizzoNull() throws {
        // Arrange
        let nome: String? = nil
        let indirizzo: String? = nil
        
        // Act
        let risultato = functions.checkNomeIndirizo(nome: nome ?? "", indirizzo: indirizzo ?? "")
        
        // Assert
        XCTAssertEqual(risultato, false)
    }
}
