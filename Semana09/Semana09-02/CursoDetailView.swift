//
//  CursoDetailView.swift
//  Semana09
//
//  Created by Mac11 on 21/10/25.
//

import SwiftUI

struct CursoDetailView: View {
    let course: Cursos

    var body: some View {
        VStack(spacing: 20) {
            Text(course.title)
                .font(.largeTitle)
                .bold()
            Text("Language: \(course.language)")
                .foregroundColor(.blue)
            Text(course.description)
                .multilineTextAlignment (.center)
                .padding()
            Spacer()
        }
        .padding()
        .navigationTitle (course.title)
        }

    }

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CursoDetailView(course: Cursos(title: "Sample", language: "Swift", description: "Sample Course."))
    }
}
