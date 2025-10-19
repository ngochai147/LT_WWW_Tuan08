package iuh.fit.se.bai2.services.implement;

import iuh.fit.se.bai2.entities.DienThoai;
import iuh.fit.se.bai2.entities.NhaCungCap;
import iuh.fit.se.bai2.respositories.DienThoaiRepository;
import iuh.fit.se.bai2.services.DienThoaiService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DienThoaiServiceImpl implements DienThoaiService {
    private final DienThoaiRepository repo;

    public DienThoaiServiceImpl(DienThoaiRepository repo) {
        this.repo = repo;
    }

    @Override
    public List<DienThoai> findAll() {
        return repo.findAll();
    }

    @Override
    public void save(DienThoai dt) {
        repo.save(dt);
    }

    @Override
    public void deleteById(Integer id) {
        repo.deleteById(id);
    }

    @Override
    public List<DienThoai> findByNCC(NhaCungCap ncc) {
        return repo.findByNhaCungCap(ncc);
    }
}
