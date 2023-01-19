//
//  ProjectController.swift
//
//
//  Created by Jay on 1/18/23.
//

import Foundation
import Fluent
import Vapor

struct ProjectController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let projects = routes.grouped("projects")
        projects.get(use: index)
        projects.post(use: create)
        projects.group(":projectID") { todo in
            todo.delete(use: delete)
        }
    }

    func index(req: Request) async throws -> [Project] {
        try await Project.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Project {
        let project = try req.content.decode(Project.self)
        try await project.save(on: req.db)
        return project
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let project = try await Project.find(req.parameters.get("projectID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await project.delete(on: req.db)
        return .noContent
    }
}
