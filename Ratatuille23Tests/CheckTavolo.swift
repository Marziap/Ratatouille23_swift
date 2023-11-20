//
//  CheckTavolo.swift
//  Ratatuille23Tests
//
//  Created by Marzia Pirozzi on 20/11/23.
//

import XCTest
@testable import Ratatuille23

final class CheckTavolo: XCTestCase {
    
    //    override func setUpWithError() throws {
    //        // Put setup code here. This method is called before the invocation of each test method in the class.
    //    }
    //
    //    override func tearDownWithError() throws {
    //        // Put teardown code here. This method is called after the invocation of each test method in the class.
    //    }
    
    func testTavoloEIdPositivi() throws {
        let tavolo = 17
        let id = 3
        
        let result=try functions.checkTavolo(tavolo: tavolo, id_cameriere: id)
        
        XCTAssertEqual(result, true)
        
    }
    
    func testTavoloPositivoIdNegativo() throws {
        let tavolo = 17
        let id = -3
        
        let result=try functions.checkTavolo(tavolo: tavolo, id_cameriere: id)
        
        XCTAssertEqual(result, false)
    }
    
    func testTavoloNegativoIdPositivo() throws {
        let tavolo = -17
        let id = 3
        
        let result=try functions.checkTavolo(tavolo: tavolo, id_cameriere: id)
        
        XCTAssertEqual(result, false)
    }
    
    func testTavoloIdNegativi() throws {
        let tavolo = -17
        let id = -3
        
        let result=try functions.checkTavolo(tavolo: tavolo, id_cameriere: id)
        
        XCTAssertEqual(result, false)
    }
    
    func testTavoloNullIdPositivo() throws {
        
        let tavolo:Int? = nil
        let id = 3
        
        
        XCTAssertThrowsError(try functions.checkTavolo(tavolo: tavolo ?? 0, id_cameriere: id)) { error in
            XCTAssertEqual(error as! serverAPI.MyError, serverAPI.MyError.tableEmpty)
        }
       
    }
    
    func testTavoloNullIdNegativo() throws {
        
        let tavolo:Int? = nil
        let id = -3
        
        
        XCTAssertThrowsError(try functions.checkTavolo(tavolo: tavolo ?? 0, id_cameriere: id)) { error in
            XCTAssertEqual(error as! serverAPI.MyError, serverAPI.MyError.tableEmpty)
        }
       
    }
    
}
