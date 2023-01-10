package com.soprj.sharedone_prj.controller.price;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soprj.sharedone_prj.domain.price.PriceDto;
import com.soprj.sharedone_prj.service.item.ItemService;
import com.soprj.sharedone_prj.service.price.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("price")
public class PriceController {

    @Autowired
    private PriceService priceService;

    @Autowired
    private ItemService itemService;

    @GetMapping("list")
    public void getPriceList(Model model,
                             @RequestParam(name = "page", defaultValue = "1") int page,
                             PriceDto priceDto) {
        List<PriceDto> priceList = priceService.getPriceList(page, priceDto);
        List<PriceDto> buyerList = priceService.getBuyerList();
        List<PriceDto> itemList = priceService.getItemList();

        model.addAttribute("priceList", priceList);
        model.addAttribute("buyerList", buyerList);
        model.addAttribute("itemList", itemList);
    }

    @GetMapping("register")
    public void register(Model model) {
        List<PriceDto> buyerList = priceService.getBuyerList();
        List<PriceDto> itemList = priceService.getItemList();
        model.addAttribute("buyerList", buyerList);
        model.addAttribute("itemList", itemList);
    }

    @GetMapping ("buyerList/{selected}")
    @ResponseBody
    public PriceDto buyerList(@PathVariable String selected) {
        PriceDto buyerList = priceService.buyerList(selected);
        return buyerList;
    }

    @GetMapping("itemList/{selected}")
    @ResponseBody
    public PriceDto itemList(@PathVariable String selected) {
        PriceDto itemList = priceService.itemList(selected);
        return itemList;
    }


    @PostMapping("register")
    public String register(PriceDto price){
        priceService.register(price);

        return "redirect:/price/list";
    }


    @GetMapping("modify")
    public void modify(int m_price_id, Model model) {
        List<PriceDto> buyerList = priceService.getBuyerList();
        List<PriceDto> itemList = priceService.getItemList();
        model.addAttribute("price", priceService.getById(m_price_id));
        model.addAttribute("buyerList", buyerList);
        model.addAttribute("itemList", itemList);
    }

    @PostMapping("modify")
    public String modify(PriceDto priceDto) {

        priceService.getByIdModify(priceDto);
        return "redirect:/price/list";
    }

    @PostMapping("remove")
    public String remove(@RequestParam Map<String,String> removeIdList) {

        String[] removeList = removeIdList.get("m_price_id").split(",");

        for (int i = 0; i < removeList.length; i++) {
            priceService.remove(removeList[i]);
        }

        return "redirect:/price/list";
    }

    @PostMapping("checkPeriod")
    @ResponseBody
    public List<PriceDto> checkPeriod(@RequestBody Map<String, Object> priceMap) {

        ObjectMapper mapper = new ObjectMapper();
        PriceDto priceDto = mapper.convertValue(priceMap, PriceDto.class);
        List<PriceDto> periodList = priceService.getPricePeriod(priceDto);

        return periodList;
    }
}
