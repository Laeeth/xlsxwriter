/*
 * An example of merging cells using libxlsxwriter.
 *
 * Copyright 2014-2016, John McNamara, jmcnamara@cpan.org
 *
 */
import xlsxwriter;

int main() {
    lxw_workbook  *workbook     = workbook_new("merge_range.xlsx");
    lxw_worksheet *worksheet    = workbook_add_worksheet(workbook, null);
    lxw_format    *merge_format = workbook_add_format(workbook);

    /* Configure a format for the merged range. */
    format_set_align(merge_format, LXW_ALIGN_CENTER);
    format_set_align(merge_format, LXW_ALIGN_VERTICAL_CENTER);
    format_set_bold(merge_format);
    format_set_bg_color(merge_format, LXW_COLOR_YELLOW);
    format_set_border(merge_format, LXW_BORDER_THIN);

    /* Increase the cell size of the merged cells to highlight the formatting. */
    worksheet_set_column(worksheet, 1, 3, 12, null);
    worksheet_set_row(worksheet, 3, 30, null);
    worksheet_set_row(worksheet, 6, 30, null);
    worksheet_set_row(worksheet, 7, 30, null);

    /* Merge 3 cells. */
    worksheet_merge_range(worksheet, 3, 1, 3, 3, "Merged Range", merge_format);

    /* Merge 3 cells over two rows. */
    worksheet_merge_range(worksheet, 6, 1, 7, 3, "Merged Range", merge_format);
    return workbook_close(workbook);
}
