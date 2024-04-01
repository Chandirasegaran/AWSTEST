package com.hbt.restapitest.controller;

import com.hbt.restapitest.model.StudentsDetails;
import org.springframework.web.bind.annotation.*;
// comment
@RestController
@RequestMapping("/students")
public class StudentsApi {
    StudentsDetails studentsDetails;
    @GetMapping("{regNo}")
    public StudentsDetails getStudentsDetails(String regNo){
        return studentsDetails;
    }

    @GetMapping ("hi")
    public String showHi(){
        return "Hi Segar";
    }

    @PostMapping
    public String createStudentsDetails(@RequestBody StudentsDetails studentsDetails){
        this.studentsDetails =studentsDetails;
        return "Students Details Created Successfully! okayy!!";
    }

    @PutMapping
    public String updateStudentsDetails(@RequestBody StudentsDetails studentsDetails){
        this.studentsDetails=studentsDetails;
        return "Students Details Updated Successfully!!";
    }

    @DeleteMapping
    public String deleteStudentsDetails(String regNo){
        this.studentsDetails=null;
        return "Deleted Successfully";
    }
}
