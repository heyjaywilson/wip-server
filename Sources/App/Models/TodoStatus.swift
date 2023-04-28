//
//  TodoStatus.swift
//  
//
//  Created by Jay on 4/28/23.
//

import Fluent
import Vapor

final class TodoStatus: Model, Content {
    static let schema = Schema.todoStatus

    @ID(key: .id)
    var id: UUID?

    @Parent(key: .statusID)
    var status: Status

    @Parent(key: .todoID)
    var todo:Todo

    init() { }

    init(id: UUID? = nil, statusID: UUID, todoID: UUID) {
        self.id = id
        self.status.id = statusID
        self.todo.id = todoID
    }

}
