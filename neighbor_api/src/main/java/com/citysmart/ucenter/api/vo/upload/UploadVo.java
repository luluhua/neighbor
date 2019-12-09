package com.citysmart.ucenter.api.vo.upload;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class UploadVo {
    @ApiModelProperty(value="上傳附件",name="file")
    private Object file;
    @ApiModelProperty(value="附件分組",name="groupId")
    private Integer groupId;
    @ApiModelProperty(value="服務ID",name="serviceId")
    private Integer serviceId;

//    public void getGroupId(Integer groupId) {
//        if(groupId==null){
//            this.groupId = 3;
//        }else {
//            this.groupId = groupId;
//        }
//    }
//
//    public void getServiceId(Integer serviceId) {
//
//        if(serviceId==null){
//            this.serviceId =Integer.parseInt(UUID.randomUUID().toString());
//        }else {
//            this.serviceId = serviceId;
//        }
//
//    }
}
