package InternalPurchasingAppAPI.service;
import InternalPurchasingAppAPI.client.dto.CategoryDto;

import java.util.*;

public interface CategoryService {
    CategoryDto createCategory(CategoryDto categoryDto);

    CategoryDto getCategoryById(int categoryId);

    List<CategoryDto> getAllCategories();

    CategoryDto updateCategory(int categoryId, CategoryDto updatedCategory);

    void deleteCategory(int categoryId);
}
