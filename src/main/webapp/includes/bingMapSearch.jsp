<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div id='searchBoxContainer' class='mb-2 d-flex'>
    <input 
    	type='text' 
    	id='searchBox' 
    	class="form-control" 
    	placeholder="Search Location Here..." 
    	aria-label="Search Location Here..." 
    />
    
    <div class="input-group-append">
       <button class="btn btn-primary d-flex align-items-center gap-1" type="button" onclick='onBingMapSearch()'>
       		Search 
       		<span class="bi bi-search"></span>
       </button>
     </div>
</div>

<!-- Container to put the search suggestions -->
<div id="searchBoxSuggestions"></div>