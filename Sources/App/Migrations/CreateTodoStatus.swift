//
//  CreateTodoStatus.swift
//  
//
//  Created by Jay on 4/28/23.
//

import Fluent

struct CreateTodoStatus: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Schema.todoStatus)
            .id()
            .field(.todoID, .uuid)
            .field(.statusID, .uuid)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Schema.todoStatus).delete()
    }
}
