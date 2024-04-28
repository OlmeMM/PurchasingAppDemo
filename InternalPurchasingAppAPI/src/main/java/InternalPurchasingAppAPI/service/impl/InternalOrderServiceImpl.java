package InternalPurchasingAppAPI.service.impl;

import InternalPurchasingAppAPI.client.dto.InternalOrderDto;
import InternalPurchasingAppAPI.client.dto.InternalOrderItemDto;
import InternalPurchasingAppAPI.client.dto.PlacedInternalOrderDto;
import InternalPurchasingAppAPI.exception.ResourceNotFoundException;
import InternalPurchasingAppAPI.mapper.InternalOrderItemMapper;
import InternalPurchasingAppAPI.mapper.InternalOrderMapper;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrder;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrderItem;
import InternalPurchasingAppAPI.persistence.repository.InternalOrderItemRepository;
import InternalPurchasingAppAPI.persistence.repository.InternalOrderRepository;
import InternalPurchasingAppAPI.service.InternalOrderService;
import lombok.AllArgsConstructor;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class InternalOrderServiceImpl implements InternalOrderService {

    private InternalOrderRepository internalOrderRepository;
    private InternalOrderItemRepository internalOrderItemRepository;

    @Override
    public InternalOrderDto createInternalOrder(InternalOrderDto internalOrderDto) {
        InternalOrder internalOrder = InternalOrderMapper.mapToInternalOrder(internalOrderDto);
        InternalOrder newOrder = internalOrderRepository.save(internalOrder);
        return InternalOrderMapper.mapToInternalOrderDto(newOrder);
    }

    @Override
    public InternalOrderDto getInternalOrderById(Integer internalOrderId) {
        InternalOrder internalOrder = internalOrderRepository.findById(internalOrderId)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Order ID: " + internalOrderId + " does not exist"));

        return InternalOrderMapper.mapToInternalOrderDto(internalOrder);
    }

    @Override
    public List<InternalOrderDto> getAllInternalOrders() {
        List<InternalOrder> internalOrders = internalOrderRepository.findAll();
         return internalOrders.stream().map((internalOrder) -> InternalOrderMapper.mapToInternalOrderDto(internalOrder))
                .collect(Collectors.toList());
    }

    @Override
    public InternalOrderDto updateInternalOrder(Integer internalOrderId, InternalOrderDto updatedOrder){
        InternalOrder internalOrder =  internalOrderRepository.findById(internalOrderId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + internalOrderId)
        );

        internalOrder.setTotalAmount(updatedOrder.getTotalAmount());
        internalOrder.setStatusId(updatedOrder.getStatusId());
        internalOrder.setDeliveryDate(updatedOrder.getDeliveryDate());
        internalOrder.setNotes(updatedOrder.getNotes());
        internalOrder.setCreatedAt(updatedOrder.getCreatedAt());
        internalOrder.setDeactivatedAt(updatedOrder.getDeactivatedAt());
        internalOrder.setUpdatedAt(updatedOrder.getUpdatedAt());

        InternalOrder updatedOrderObj = internalOrderRepository.save(internalOrder);
        return InternalOrderMapper.mapToInternalOrderDto(updatedOrderObj);
    }

    @Override
    public void deleteInternalOrder(Integer internalOrderId) {
        InternalOrder internalOrder =  internalOrderRepository.findById(internalOrderId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + internalOrderId)
        );
        internalOrderRepository.deleteById(internalOrderId);
    }

    @Async
    public void processOrderItems(List<InternalOrderItemDto> internalOrderItemDtoList, Integer internalOrderId) {
        internalOrderItemDtoList.forEach(orderItem -> {
            InternalOrderItem orderItemEntity = InternalOrderItemMapper.mapToInternalOrderItem(orderItem);
            orderItemEntity.setInternalOrderId(internalOrderId);
            internalOrderItemRepository.save(orderItemEntity);
        });
    }

    @Override
    public InternalOrderDto placeAnInternalOrder(PlacedInternalOrderDto placedInternalOrderAttempt) {
        InternalOrderDto internalOrderDto = placedInternalOrderAttempt.getPlacedOrder();
        InternalOrderDto internalOrderDtoResponse = createInternalOrder(internalOrderDto);

        // get internalOrderId to assign to each internal order item internalOrderId property
        Integer internalOrderId = internalOrderDtoResponse.getId();

        //get the list of internal orders
        List<InternalOrderItemDto> internalOrderItemDtoList = placedInternalOrderAttempt.getPlacedOrderItems();
        // insert each internal order item into the internal order items table
        processOrderItems(internalOrderItemDtoList, internalOrderId);

        return internalOrderDtoResponse;
    }

//    @Override
//    public InternalOrderDto deactivateInternalOrder(Integer internalOrderId) {
//        // get internal order
//        InternalOrderDto orderToDeactivate = getInternalOrderById(internalOrderId);
//        // Set the deactivatedAt property to the current date and time
//        orderToDeactivate.setDeactivatedAt(LocalDateTime.now());
//
//        // Save the updated order
//        return internalOrderRepository.save(orderToDeactivate);
//    }
}
