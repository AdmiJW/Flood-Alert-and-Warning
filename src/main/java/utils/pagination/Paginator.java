package utils.pagination;

import lombok.Getter;
import lombok.Setter;

import java.util.Collections;
import java.util.List;


// A very simple paginator class that can be used to paginate a list of elements.

@Getter
@Setter
public class Paginator<T> {

    private List<T> elements;
    private int totalPages;
    private int totalElements;
    private int pageSize;

    public Paginator(List<T> elements, int pageSize) {
        this.elements = elements;
        this.pageSize = pageSize;
        this.totalElements = elements.size();
        this.totalPages = (int) Math.ceil((double) totalElements / pageSize);
    }

    public List<T> getPage(int page) {
        if (page < 1 || page > totalPages) return Collections.emptyList();

        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, totalElements);
        return elements.subList(fromIndex, toIndex);
    }
}

