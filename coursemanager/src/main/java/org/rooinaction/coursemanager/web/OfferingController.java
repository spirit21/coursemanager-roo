package org.rooinaction.coursemanager.web;
import org.rooinaction.coursemanager.model.Offering;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/offerings")
@Controller
@RooWebScaffold(path = "offerings", formBackingObject = Offering.class)
public class OfferingController {
}
