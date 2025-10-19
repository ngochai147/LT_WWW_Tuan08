package iuh.fit.se.bai2.controllers;
import iuh.fit.se.bai2.entities.DienThoai;
import iuh.fit.se.bai2.entities.NhaCungCap;
import iuh.fit.se.bai2.respositories.DienThoaiRepository;
import iuh.fit.se.bai2.respositories.NhaCungCapRepository;
import iuh.fit.se.bai2.services.DienThoaiService;
import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;

import java.io.IOException;
import java.util.List;

@Controller
public class DienThoaiController {
    @Autowired
    private DienThoaiService dtService;
    @Autowired
    private NhaCungCapRepository nccRepo;

    private final ServletContext servletContext;
    @Autowired
    private NhaCungCapRepository nhaCungCapRepository;

    public DienThoaiController(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @GetMapping("/")
    public String list(Model model, @RequestParam(value = "ncc", required = false) Integer nccId) {
        List<DienThoai> list;
        if (nccId != null) {
            NhaCungCap ncc = nccRepo.findById(nccId).orElse(null);
            list = dtService.findByNCC(ncc);
        } else list = dtService.findAll();
        model.addAttribute("list", list);
        model.addAttribute("nccs", nccRepo.findAll());
        model.addAttribute("nccId", nccId);
        return "danh_sach";
    }

    @GetMapping("/add")
    public String showForm(Model model) {
        model.addAttribute("dienThoai", new DienThoai());
        model.addAttribute("nccs", nccRepo.findAll());
        return "dien_thoai_form";
    }

    @PostMapping("/add")
    public String addDienThoai(@Valid @ModelAttribute DienThoai dienThoai,
                               BindingResult result,
                               @RequestParam("file") MultipartFile file,
                               Model model) throws IOException {

        if (result.hasErrors()) {
            model.addAttribute("nccList", nhaCungCapRepository.findAll());
            return "dien_thoai_form";
        }

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

            if (!fileExtension.matches("png|jpg|jpeg")) {
                model.addAttribute("fileError", "Chỉ chấp nhận định dạng ảnh: png, jpg, jpeg");
                model.addAttribute("nccList", nhaCungCapRepository.findAll());
                return "dien_thoai_form";
            }

            String uploadDir = servletContext.getRealPath("/resources/images");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            File serverFile = new File(dir, fileName);
            file.transferTo(serverFile);

            dienThoai.setHinhAnh(fileName);
        }

        dtService.save(dienThoai);
        return "redirect:/";
    }


    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        dtService.deleteById(id);
        return "redirect:/";
    }
}
