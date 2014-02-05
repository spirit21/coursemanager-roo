package org.rooinaction.coursemanager.web;
import org.rooinaction.coursemanager.model.TrainingProgram;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/trainingprograms")
@Controller
@RooWebScaffold(path = "trainingprograms", formBackingObject = TrainingProgram.class)
public class TrainingProgramController {
}
