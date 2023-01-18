package com.soprj.sharedone_prj.service.report;

import com.soprj.sharedone_prj.domain.report.ReportHeaderDto;
import com.soprj.sharedone_prj.domain.report.TotalReportDto;
import com.soprj.sharedone_prj.mapper.report.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ReportService {

    @Autowired
    private ReportMapper reportMapper;

    public List<TotalReportDto> reportList() {
        return reportMapper.reportList();
    }

    public ReportHeaderDto reportDetail(int m_order_id) {
        return reportMapper.reportDetail(m_order_id);
    }

    public List<Map<String, String>> sortedReport() {
        return reportMapper.sortedReport();
    }

    public List<Map<String, String>> buyerReport() {
        return reportMapper.buyerReport();
    }
}
