package InternalPurchasingAppAPI.service;

import InternalPurchasingAppAPI.client.dto.InternalOrderDto;
import InternalPurchasingAppAPI.client.dto.PlacedInternalOrderDto;

import java.util.*;

public interface InternalOrderService {
    InternalOrderDto createInternalOrder(InternalOrderDto internalOrderDto);

    InternalOrderDto getInternalOrderById(Integer id);

    List<InternalOrderDto> getAllInternalOrders();

    InternalOrderDto updateInternalOrder(Integer id, InternalOrderDto updatedOrder);

    void deleteInternalOrder(Integer id);

    InternalOrderDto placeAnInternalOrder(PlacedInternalOrderDto placedInternalOrderAttempt);
}
