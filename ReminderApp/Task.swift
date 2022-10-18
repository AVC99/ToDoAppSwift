//
//  Task.swift
//  ReminderApp
//
//  Created by Arnau Vives on 17/10/22.
//

import Foundation

class Task{
    
    private var taskName: String
    private var taskStatus: Bool
    private var assignedTo: String
    private var date : Date
    
    init(taskName: String, taskStatus: Bool, assignedTo: String, date: Date){
        self.taskName = taskName
        self.taskStatus = taskStatus
        self.assignedTo = assignedTo
        self.date = date
    }

    public func getTaskName()-> String{
        return taskName
    }
    public func getTaskStatus()-> Bool{
        return taskStatus
    }
    public func  getAssignedTo()-> String{
        return self.assignedTo
    }
    public func getDate()-> Date{
        return date
    }
    
    public func switchStatus(){
        if (self.taskStatus == false) {
            self.taskStatus = true
        }else{
            self.taskStatus = false
        }
    }
}
