package com.uni.controller;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.uni.service.MemberService;
import com.uni.service.WorkPlaceService;
/**
* Handles requests for the application home page.
*/
@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Autowired
    private WorkPlaceService workplaceService;
    
    @Autowired
    private MemberService memberService;
    
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        /*
         * logger.info("Welcome home! The client locale is {}.", locale);
         *
         * Date date = new Date(); DateFormat dateFormat =
         * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
         *
         * String formattedDate = dateFormat.format(date);
         *
         * model.addAttribute("serverTime", formattedDate );
         */
        
        int workplace_ICount = workplaceService.getWorkplace_ICount();
        int workplace_SCount = workplaceService.getWorkplace_SCount();
        int memberCount = memberService.getMemberCount();
        
        model.addAttribute("workplace_ICount", workplace_ICount);
        model.addAttribute("workplace_SCount", workplace_SCount);
        model.addAttribute("memberCount", memberCount);
        	model.addAttribute("flag","index");
        
        return "uniform/index";
    }
    
}