package InternalPurchasingAppAPI.service.impl;

import InternalPurchasingAppAPI.client.dto.InternalOrderDto;
import InternalPurchasingAppAPI.exception.ResourceNotFoundException;
import InternalPurchasingAppAPI.mapper.InternalOrderMapper;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrder;
import InternalPurchasingAppAPI.persistence.repository.InternalOrderRepository;
import InternalPurchasingAppAPI.service.InternalOrderService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class InternalOrderServiceImpl implements InternalOrderService {

    private InternalOrderRepository internalOrderRepository;

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
}
