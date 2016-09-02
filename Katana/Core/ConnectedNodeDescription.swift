//
//  ConnectedNodeDescription.swift
//  Katana
//
//  Created by Mauro Bolis on 19/08/16.
//  Copyright © 2016 Bending Spoons. All rights reserved.
//

import Foundation

public protocol AnyConnectedNodeDescription {
  static func anyConnect(parentProps: Any, storageState: Any) -> Any
}

public protocol ConnectedNodeDescription: AnyConnectedNodeDescription {
  associatedtype PropsType: Equatable, Frameable = EmptyProps
  associatedtype StorageState: State

  static func connect(props: inout PropsType, storageState: StorageState)
}

public extension ConnectedNodeDescription {
  static func anyConnect(parentProps: Any, storageState: Any) -> Any {
    if let parentProps = parentProps as? PropsType, let s = storageState as? StorageState {
      var parentPropsCopy = parentProps
      self.connect(props: &parentPropsCopy, storageState: s)
      return parentPropsCopy
      
    }
    
    fatalError("invalid signature of the connect function of \(type(of: self))")
  }
}