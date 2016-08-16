//
//  PlasticDimensionsTests.swift
//  Katana
//
//  Created by Mauro Bolis on 16/08/16.
//  Copyright © 2016 Bending Spoons. All rights reserved.
//

import Foundation
import XCTest
@testable import Katana

class PlasticDimensionsTests: XCTestCase {
  func testValueShouldHaveZeroValue() {
    XCTAssertEqual(PlasticValue.zero.scalable, 0)
    XCTAssertEqual(PlasticValue.zero.fixed, 0)
  }
  
  func testValueShouldBeScalable() {
    let value = PlasticValue(scalable: 10, fixed: 20)
    XCTAssertEqual(value.scale(20), 10 * 20 + 20)
  }
  
  func testValueShouldHaveUnscaledValue() {
    let value = PlasticValue(scalable: 10, fixed: 20)
    XCTAssertEqual(value.unscaledValue, 10 + 20)
  }
  
  func testValueCanBeInverted() {
    let value = PlasticValue(scalable: 10, fixed: 20)
    let invertedValue = -value
    XCTAssertEqual(invertedValue.scalable, -10)
    XCTAssertEqual(invertedValue.fixed, -20)
  }
  
  func testValueCanBeMutliplied() {
    let value = PlasticValue(scalable: 10, fixed: 20)
    let multipliedValue = value * 100
    XCTAssertEqual(multipliedValue.scalable, 10 * 100)
    XCTAssertEqual(multipliedValue.fixed, 20 * 100)
  }
  
  func testValueCanBeAdded() {
    let value1 = PlasticValue(scalable: 10, fixed: 20)
    let value2 = PlasticValue(scalable: 21, fixed: 33)
    let total = value1 + value2
    
    XCTAssertEqual(total.scalable, 10 + 21)
    XCTAssertEqual(total.fixed, 20 + 33)
  }
  
  func testValueCanBeDivided() {
    let value = PlasticValue(scalable: 10, fixed: 20)
    let multipliedValue = value / 100
    XCTAssertEqual(multipliedValue.scalable, 10 / 100)
    XCTAssertEqual(multipliedValue.fixed, 20 / 100)
  }
  
  func testSizeShouldHaveZeroValue() {
    let zero = PlasticSize.zero
    XCTAssertEqual(zero.width, PlasticValue.zero)
    XCTAssertEqual(zero.height, PlasticValue.zero)
  }
  
  func testSizeShouldBeScalable() {
    let size = PlasticSize(scalableWidth: 10, fixedWidth: 20, scalableHeight: 100, fixedHeight: 300)
    let scaled = size.scale(100)
    XCTAssertEqual(scaled.width, 10 * 100 + 20)
    XCTAssertEqual(scaled.height, 100 * 100 + 300)
  }
  
  func testSizeCanBeMutliplied() {
    let size = PlasticSize(scalableWidth: 10, fixedWidth: 20, scalableHeight: 100, fixedHeight: 300)
    let multipliedSize = size * 100
    XCTAssertEqual(multipliedSize.width.scalable, 10 * 100)
    XCTAssertEqual(multipliedSize.width.fixed, 20 * 100)
    XCTAssertEqual(multipliedSize.height.scalable, 100 * 100)
    XCTAssertEqual(multipliedSize.height.fixed, 300 * 100)
  }
  
  func testSizeCanBeAdded() {
    let size1 = PlasticSize(scalableWidth: 10, fixedWidth: 20, scalableHeight: 100, fixedHeight: 300)
    let size2 = PlasticSize(scalableWidth: 20, fixedWidth: 30, scalableHeight: 90, fixedHeight: 10)
    let total = size1 + size2
    
    XCTAssertEqual(total.width.scalable, 10 + 20)
    XCTAssertEqual(total.width.fixed, 20 + 30)
    XCTAssertEqual(total.height.scalable, 100 + 90)
    XCTAssertEqual(total.height.fixed, 300 + 10)
  }
  
  func testSizeCanBeDivided() {
    let size = PlasticSize(scalableWidth: 10, fixedWidth: 20, scalableHeight: 100, fixedHeight: 300)
    let dividedSize = size / 100
    XCTAssertEqual(dividedSize.width.scalable, 10 / 100)
    XCTAssertEqual(dividedSize.width.fixed, 20 / 100)
    XCTAssertEqual(dividedSize.height.scalable, 100 / 100)
    XCTAssertEqual(dividedSize.height.fixed, 300 / 100)
  }
  
  func testEdgeInsetsShouldHaveZeroValue() {
    let zero = PlasticEdgeInsets.zero
    XCTAssertEqual(zero.top, PlasticValue.zero)
    XCTAssertEqual(zero.left, PlasticValue.zero)
    XCTAssertEqual(zero.bottom, PlasticValue.zero)
    XCTAssertEqual(zero.right, PlasticValue.zero)
  }
  
  func testEdgeInsetsShouldBeScalable() {
    let insets = PlasticEdgeInsets(
      scalableTop: 10,
      fixedTop: 20,
      scalableLeft: 100,
      fixedLeft: 300,
      scalableBottom: 200,
      fixedBottom: 50,
      scalableRight: 100,
      fixedRight: 99
    )
  
    let scaled = insets.scale(5)
    XCTAssertEqual(scaled.top, 10 * 5 + 20)
    XCTAssertEqual(scaled.left, 100 * 5 + 300)
    XCTAssertEqual(scaled.bottom, 200 * 5 + 50)
    XCTAssertEqual(scaled.right, 100 * 5 + 99)
  }
  
  func testEdgeInsetsCanBeMutliplied() {
    let insets = PlasticEdgeInsets(
      scalableTop: 10,
      fixedTop: 20,
      scalableLeft: 100,
      fixedLeft: 300,
      scalableBottom: 200,
      fixedBottom: 50,
      scalableRight: 100,
      fixedRight: 99
    )
    
    let multiplied = insets * 5
    XCTAssertEqual(multiplied.top.scalable, 10 * 5)
    XCTAssertEqual(multiplied.top.fixed, 20 * 5)
    XCTAssertEqual(multiplied.left.scalable, 100 * 5)
    XCTAssertEqual(multiplied.left.fixed, 300 * 5)
    XCTAssertEqual(multiplied.bottom.scalable, 200 * 5)
    XCTAssertEqual(multiplied.bottom.fixed, 50 * 5)
    XCTAssertEqual(multiplied.right.scalable, 100 * 5)
    XCTAssertEqual(multiplied.right.fixed, 99 * 5)
  }
  
  func testEdgeInsetsCanBeAdded() {
    let value1 = PlasticEdgeInsets(
      scalableTop: 10,
      fixedTop: 20,
      scalableLeft: 100,
      fixedLeft: 300,
      scalableBottom: 200,
      fixedBottom: 50,
      scalableRight: 100,
      fixedRight: 99
    )
    
    let value2 = PlasticEdgeInsets(
      scalableTop: 11,
      fixedTop: 201,
      scalableLeft: 10,
      fixedLeft: 12,
      scalableBottom: 56,
      fixedBottom: 11,
      scalableRight: 8,
      fixedRight: 991
    )
    
    let sum = value1 + value2
    
    XCTAssertEqual(sum.top.scalable, 10 + 11)
    XCTAssertEqual(sum.top.fixed, 20 + 201)
    XCTAssertEqual(sum.left.scalable, 100 + 10)
    XCTAssertEqual(sum.left.fixed, 300 + 12)
    XCTAssertEqual(sum.bottom.scalable, 200 + 56)
    XCTAssertEqual(sum.bottom.fixed, 50 + 11)
    XCTAssertEqual(sum.right.scalable, 100 + 8)
    XCTAssertEqual(sum.right.fixed, 99 + 991)
  }
  
  func testEdgeInsetsCanBeDivided() {
    let insets = PlasticEdgeInsets(
      scalableTop: 10,
      fixedTop: 20,
      scalableLeft: 100,
      fixedLeft: 300,
      scalableBottom: 200,
      fixedBottom: 50,
      scalableRight: 100,
      fixedRight: 99
    )
    
    let divided = insets / 5
    XCTAssertEqual(divided.top.scalable, 10 / 5)
    XCTAssertEqual(divided.top.fixed, 20 / 5)
    XCTAssertEqual(divided.left.scalable, 100 / 5)
    XCTAssertEqual(divided.left.fixed, 300 / 5)
    XCTAssertEqual(divided.bottom.scalable, 200 / 5)
    XCTAssertEqual(divided.bottom.fixed, 50 / 5)
    XCTAssertEqual(divided.right.scalable, 100 / 5)
    XCTAssertEqual(divided.right.fixed, 99 / 5)
  }
}
