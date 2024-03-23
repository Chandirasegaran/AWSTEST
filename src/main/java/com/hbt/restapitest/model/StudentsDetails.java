package com.hbt.restapitest.model;

public class StudentsDetails {
    private String regNo;
    private String studentName;
    private String studentCity;

    public StudentsDetails() {
    }

    public StudentsDetails(String regNo, String studentName, String studentCity) {
        this.regNo = regNo;
        this.studentName = studentName;
        this.studentCity = studentCity;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentCity() {
        return studentCity;
    }

    public void setStudentCity(String studentCity) {
        this.studentCity = studentCity;
    }
}
