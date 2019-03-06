//
//  EventQuery.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



/**
 * A query is an event that aims to fetch classes from the database.
 * It is highly editable from the client side to avoid backend development.
 * The security about the content's accessibility is handled by the API.
 */
public protocol EventQuery: Event {
    
    /**
     * The collection/class name to query
     */
    var `class`: EventQueryClass { get }
    
    /**
     * Contains custom information set by or with the input.
     * This data structure is defined and understood by the controller that triggered the event.
     */
    var data: [String: Any?] { get }
    
    /**
     * Defines the constraints of the query to select specific documents.
     */
    var `where`: EventQueryWhere { get }
    
    init(className: String, fields: [String], field: [String: [String: Any]], limit: Int?, order: EventQueryWhereOrder, start: Int)
    
}

public extension EventQuery {
    
    public var `class`: EventQueryClass {
        guard let name = data["className"] as? String, let fields = data["fields"] as? [String] else {
            return _Class(name: "", fields: [])
        }
        return _Class(name: name, fields:fields)
    }
    
    public var `where`: EventQueryWhere {
        guard let field = data["field"] as? [String: [String: Any]], let limit = data["limit"] as? Int, let order = data["order"] as? EventQueryWhereOrder, let start = data["start"] as? Int else {
            return _Where(field: [:], limit: nil, order: .ascending, start: 0)
        }
        return _Where(field: field, limit: limit, order: order, start: start)
    }
}

public class Query: EventQuery {
    
    public var data: [String : Any?]
    
    public required init(className: String, fields: [String], field: [String : [String : Any]] = [:], limit: Int? = nil, order: EventQueryWhereOrder = .ascending, start: Int = 0) {
        self.data = ["className": className, "fields": fields, "field": field, "limit": limit, "order": order, "start": start]
        self.meta = Meta(.query)
    }
    
    public var meta: Query.Meta
    
}

/**
 * Selects the collection and the fields that need to be returned.
 * A query may only ask for one collection at the same time.
 * However, it can select the subfields of any pointer.
 */
public protocol EventQueryClass {
    
    /**
     * The collection/class name to query
     */
    var name: String { get }
    
    /**
     * The collection fields to query
     */
    var fields: [String] { get }
    
}

public struct _Class: EventQueryClass {
    
    public var name: String
    
    public var fields: [String]
    
}

/**
 * Represents how the query results will be ordered
 */
public enum EventQueryWhereOrder {
    case ascending
    case descending
}

/**
 * Defines the constraints of the query to select specific documents.
 */
public protocol EventQueryWhere {
    
    /**
     * The request constraints as a dictionary. Keys are the related fields,
     * and values are sub-dictionaries with the constraints.
     *
     * Example:
     *
     * field: {
     *     masterDayDuration: {
     *         ≤: 7200,
     *         ≥: 3600,
     *     },
     *     masterNightDuration: {
     *         =: 0
     *     }
     * }
     */
    var field: [String: [String: Any]] { get }
    
    /**
     * The limit number of results to fetch
     */
    var limit: Int? { get }
    
    /**
     * The results ordering
     */
    var order: EventQueryWhereOrder { get }
    
    /**
     * Start index of returned bunch of results. Useful for pagination.
     */
    var start: Int { get }
    
}

public struct _Where: EventQueryWhere {
    
    public var field: [String : [String : Any]]
    
    public var limit: Int?
    
    public var order: EventQueryWhereOrder
    
    public var start: Int
    
}
