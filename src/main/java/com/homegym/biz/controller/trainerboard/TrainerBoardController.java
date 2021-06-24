package com.homegym.biz.controller.trainerboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homegym.biz.trainerboard.TrainerBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/trainerBoard/*")
public class TrainerBoardController {
//	@Autowired
//	TrainerBoardService trainerBoardService;

}
