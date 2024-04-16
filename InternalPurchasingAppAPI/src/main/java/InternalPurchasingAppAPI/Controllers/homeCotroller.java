package InternalPurchasingAppAPI.Controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class homeCotroller {

    @GetMapping
    public String home(Principal principal) {
        return "Hello JWT !" + principal.getName();

    }
}
