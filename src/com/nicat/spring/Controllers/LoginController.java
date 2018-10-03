package com.nicat.spring.Controllers;

import com.nicat.spring.DBRepositories.DBWorkerInterface;
import com.nicat.spring.Entity.Ingredient;
import com.nicat.spring.Entity.Recipe;
import com.nicat.spring.Entity.User;
import com.nicat.spring.LoggedIn.LoggedInUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private DBWorkerInterface dbworker;

    private boolean isSet;

    @RequestMapping("/login")
    public String showLogin() {
        return "login";
    }

    @RequestMapping("/usercooking")
    public ModelAndView showUserCooking(HttpServletRequest request) {
        String message = "";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordHash = String.valueOf(password.hashCode());

        User u = dbworker.getUserByUsername(username);

        boolean isOk = true;
        if (u == null) {
            isOk = false;
            message = "Error: no such user!";
        } else if (!u.getPasswordHash().equals(passwordHash)) {
            isOk = false;
            message = "Error: wrong password!";
        }

        ModelAndView mv;
        if (isOk) {
            LoggedInUser.setUser(u);
            mv = new ModelAndView("user_cooking");
            List<Recipe> recipes = u.getRecipes();
            mv.addObject("user", u);
            mv.addObject("recipes", recipes);
        } else {
            mv = new ModelAndView("error");
            mv.addObject("message", message);
        }

        return mv;
    }

    // kad se u listi prikazu svi recepti klikom na neki od njih vadi podatke o tom objektu i baca nas na stranicu gde su oni prikazani
    @RequestMapping("/getrecipeinfo")
    // probati direktno izvlacenje objekta
    public ModelAndView getRecipeInfo(@RequestParam int id) {
        User user = LoggedInUser.getUser();
        Recipe recipe = user.getRecipeByIndex(id - 1);
        Ingredient i = recipe.getIngredient();
        ModelAndView mv = new ModelAndView("recipe_details");
        mv.addObject("recipe", recipe);
        mv.addObject("ingredient", i);
        return mv;
    }

    @RequestMapping("/swapRecipesOrder")
    public ModelAndView swapRecipesOrder(@RequestParam int id) {
        User user = LoggedInUser.getUser();
        List<Recipe> recipes = user.getRecipes();
        Recipe recipe = recipes.get(id - 1);

        ModelAndView mv = new ModelAndView("user_cooking");
        isSet = true;
        mv.addObject("isSet", isSet);
        mv.addObject("user", user);
        mv.addObject("recipes", recipes);
        mv.addObject("recipeFirst", recipe);

        return mv;
    }
}

