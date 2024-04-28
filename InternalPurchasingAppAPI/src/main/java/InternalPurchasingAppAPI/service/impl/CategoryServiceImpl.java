package InternalPurchasingAppAPI.service.impl;

import InternalPurchasingAppAPI.client.dto.CategoryDto;
import InternalPurchasingAppAPI.exception.ResourceNotFoundException;
import InternalPurchasingAppAPI.mapper.CategoryMapper;
import InternalPurchasingAppAPI.persistence.entitiy.Category;
import InternalPurchasingAppAPI.persistence.repository.CategoryRepository;
import InternalPurchasingAppAPI.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private CategoryRepository categoryRepository;

    @Override
    public CategoryDto createCategory(CategoryDto categoryDto) {
        Category category = CategoryMapper.mapToCategory(categoryDto);
        Category newCategory = categoryRepository.save(category);
        return CategoryMapper.mapToCategoryDto(newCategory);
    }

    @Override
    public CategoryDto getCategoryById(int categoryId) {
        Category category = categoryRepository.findById(categoryId)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Category ID: " + categoryId + " does not exist"));

        return CategoryMapper.mapToCategoryDto(category);
    }

    @Override
    public List<CategoryDto> getAllCategories() {
        List<Category> categories = categoryRepository.findAll();
        return categories.stream().map((category) -> CategoryMapper.mapToCategoryDto(category))
                .collect(Collectors.toList());
    }

    @Override
    public CategoryDto updateCategory(int categoryId, CategoryDto updatedCategory){
        Category category =  categoryRepository.findById(categoryId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + categoryId)
        );

        category.setName(updatedCategory.getName());

        Category updatedCategoryObj = categoryRepository.save(category);
        return CategoryMapper.mapToCategoryDto(updatedCategoryObj);
    }

    @Override
    public void deleteCategory(int categoryId) {
        Category category =  categoryRepository.findById(categoryId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + categoryId)
        );
        categoryRepository.deleteById(categoryId);
    }
}
