package InternalPurchasingAppAPI.mapper;

import InternalPurchasingAppAPI.client.dto.CategoryDto;
import InternalPurchasingAppAPI.persistence.entitiy.Category;

public class CategoryMapper {
    public static CategoryDto mapToCategoryDto(Category category){
        return new CategoryDto(
                category.getCategoryId(),
                category.getName()
        );
    }

    public static Category mapToCategory(CategoryDto categoryDto){
        return new Category(
                categoryDto.getCategoryId(),
                categoryDto.getName()
        );
    }
}
