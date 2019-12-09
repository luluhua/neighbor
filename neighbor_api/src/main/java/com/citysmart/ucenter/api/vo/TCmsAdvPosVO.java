package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;
import com.citysmart.ucenter.api.vo.TCmsAdvVO;

import java.util.List;

/**
 * @author li
 * @date 2019/4/2
 */
@Setter
@Getter
public class TCmsAdvPosVO {

    private String sort;
    private List<TCmsAdvVO> adv;
    private Integer layout;

    @Override
    public String toString() {
        return "TCmsAdvPosVO{" +
                "sort=" + sort +
                ", adv=" + adv +
                ", layout=" + layout +
                "}";
    }

}
