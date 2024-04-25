package InternalPurchasingAppAPI.client.controller;
import InternalPurchasingAppAPI.client.dto.CategoryDto;
import InternalPurchasingAppAPI.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@RestController
@RequestMapping("/category")
public class CategoryController {

    private final CategoryService CategoryService;

    @Autowired
    public CategoryController(CategoryService CategoryService) {
        this.CategoryService = CategoryService;
    };

    @PostMapping("/create")
    public ResponseEntity<CategoryDto> createCategory(@RequestBody CategoryDto CategoryDto){
        CategoryDto newCategory = CategoryService.createCategory(CategoryDto);
        return ResponseEntity.ok(newCategory);
    }

    @GetMapping("/find/{id}")
    public ResponseEntity<CategoryDto> getCategoryById(@PathVariable("id") int CategoryId){
        CategoryDto CategoryDto = CategoryService.getCategoryById(CategoryId);
        return ResponseEntity.ok(CategoryDto);
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<CategoryDto>> getAllCategories(){
        List<CategoryDto> Categories = CategoryService.getAllCategories();
        return ResponseEntity.ok(Categories);
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<CategoryDto> updateCategory(@PathVariable("id") int CategoryId, @RequestBody CategoryDto updatedCategory){
        CategoryDto CategoryDto = CategoryService.updateCategory(CategoryId, updatedCategory);
        return ResponseEntity.ok(CategoryDto);
    }

    @DeleteMapping
    public ResponseEntity<String> deleteCategory(int CategoryId){
        CategoryService.deleteCategory(CategoryId);
        return ResponseEntity.ok("Category deleted successfully!");
    }
}